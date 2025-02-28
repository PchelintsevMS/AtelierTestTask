import * as React from "react";
import { useState, useEffect } from 'react';
import { Client, Specialist } from '../types';

interface ClientAddFormProps {
    onClientAdded: () => void;
}

const ClientAdd: React.FC<ClientAddFormProps> = ({ onClientAdded }) => {
    const [newClient, setNewClient] = useState<Client>({ id: 0, name: '', phone: '', specialistId: 0 });
    const [specialists, setSpecialists] = useState<Specialist[]>([]);

    useEffect(() => {
        fetchSpecialists();
    }, []);

    const fetchSpecialists = async () => {
        const response = await fetch('/specialists');
        if (response.ok) {
            const data = await response.json();
            setSpecialists(data);
        }
    };

    const handleInputChange = (event: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
        const { name, value } = event.target;
        setNewClient({ ...newClient, [name]: value });
    };

    const handleSubmit = async (event: React.FormEvent) => {
        event.preventDefault();
        const response = await fetch('http://localhost:5234/api/clients', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(newClient),
        });

        if (response.ok) {
            onClientAdded();
            setNewClient({ id: 0, name: '', phone: '', specialistId: 0 });
        }
    };

    return (
        <form onSubmit={handleSubmit} className="client-add-form">
            <input
                type="text"
                name="name"
                placeholder="Client Name"
                value={newClient.name}
                onChange={handleInputChange}
                className="form-input"
            />
            <input
                type="text"
                name="phone"
                placeholder="Client Phone"
                value={newClient.phone}
                onChange={handleInputChange}
                className="form-input"
            />
            <select
                name="specialistId"
                value={newClient.specialistId}
                onChange={handleInputChange}
                className="form-select"
            >
                <option value={0}>Select Specialist</option>
                {specialists.map(specialist => (
                    <option key={specialist.id} value={specialist.id}>
                        {specialist.name}
                    </option>
                ))}
            </select>
            <button className="form-button" type="submit">Add Client</button>
        </form>
    );
};

export default ClientAdd;