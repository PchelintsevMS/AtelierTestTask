import * as React from "react";
import { useEffect, useState } from 'react';
import { Client } from '../types';

interface ClientListProps {
    onClientSelect: (id: number) => void;
}

const ClientList: React.FC<ClientListProps> = ({ onClientSelect }) => {
    const [clients, setClients] = useState<Client[]>([]);

    useEffect(() => {
        fetchClients();
    }, []);

    const fetchClients = async () => {
        const response = await fetch('/clients');
        if (response.ok) {
            const data = await response.json();
            setClients(data);
        }
    };

    return (
        <div>
            <h2>Client List</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Specialist</th>
                    </tr>
                </thead>
                <tbody>
                    {clients.map(client => (
                        <tr key={client.id} onClick={() => onClientSelect(client.id)}>
                            <td>{client.id}</td>
                            <td>{client.name}</td>
                            <td>{client.phone}</td>
                            <td>{client.specialist?.name}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
};

export default ClientList;