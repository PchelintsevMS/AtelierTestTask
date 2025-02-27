import * as React from "react";
import { useEffect, useState } from 'react';
import { Client } from '../types';

interface ClientDetailsProps {
    id: number;
}

const ClientID: React.FC<ClientDetailsProps> = ({ id }) => {
    const [client, setClient] = useState<Client | null>(null);

    useEffect(() => {
        fetchClient(id);
    }, [id]);

    const fetchClient = async (id: number) => {
        const response = await fetch(`/clients/${id}`);
        if (response.ok) {
            const data = await response.json();
            setClient(data);
        }
    };

    return (
        <div>
            <h2>Client Details</h2>
            <p>ID: {client.id}</p>
            <p>Name: {client.name}</p>
            <p>Specialist: {client.specialist?.name}</p>
        </div>
    );
};

export default ClientID;