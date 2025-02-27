import * as React from "react";
import { useState } from 'react';
import ClientList from './components/ClientList';
import ClientDetails from './components/ClientID';
import AddClientForm from './components/ClientAdd';
import './App.css';

const App: React.FC = () => {
    const [view, setView] = useState<"add" | "list" | "details">("list");
    const [selectedClientId, setSelectedClientId] = useState<number | null>(null);

    const showAddClientForm = () => {
        setView("add");
    };

    const showClientList = () => {
        setView("list");
    };

    const showClientDetails = (id: number) => {
        setSelectedClientId(id);
        setView("details");
    };

    return (
        <div className="Atelier">
            <h1>Atelier</h1>
            <div className="button-container">
                <button onClick={showAddClientForm}>Add New Client</button>
                <button onClick={showClientList}>Show All Clients</button>
            </div>

            <div className="content">
                {view === "add" && <AddClientForm onClientAdded={showClientList} />}
                {view === "list" && <ClientList onClientSelect={showClientDetails} />}
                {view === "details" && selectedClientId && (
                    <ClientDetails id={selectedClientId} />
                )}
            </div>
        </div>
    );
};

export default App;