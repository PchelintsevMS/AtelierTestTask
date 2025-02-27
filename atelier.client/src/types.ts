export interface Client {
    id: number;
    name: string;
    phone: string;
    specialistId: number;
    specialist?: Specialist;
}

export interface Specialist {
    id: number;
    name: string;
}