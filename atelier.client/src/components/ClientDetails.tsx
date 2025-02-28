import * as React from "react";
import { useEffect, useState } from "react";
import { Client } from "../types";

interface ClientDetailsProps {
    id: number;
}

const ClientDetails: React.FC<ClientDetailsProps> = ({ id }) => {
    const [client, setClient] = useState<Client | null>(null);
    const [averageDuration, setAverageDuration] = useState<number | null>(null);

    useEffect(() => {
        fetchClientDetails();
    }, [id]);

    const fetchClientDetails = async () => {
        const response = await fetch(`http://localhost:5234/api/clients/${id}`);
        if (response.ok) {
            const data = await response.json();
            setClient(data);
        }
    };

    const fetchAverageOrderDuration = async () => {
        const response = await fetch(`http://localhost:5234/api/clients/${id}/average-order`);
        if (response.ok) {
            const data = await response.json();
            setAverageDuration(data.AverageDuration);
        }
    };

    return (
        <div>
            {client ? (
                <>
                    <h2>{client.name} ({client.phone})</h2>
                    <button onClick={fetchAverageOrderDuration}>
                        Show Average Order Duration
                    </button>
                    {averageDuration !== null && (
                        <p>Average Order Duration: {averageDuration} days</p>
                    )}
                </>
            ) : (
                <p>Loading client details...</p>
            )}
        </div>
    );
};

export default ClientDetails;
