export interface ZdravotnePoistenie {
    idPoistovna: number;
    idPacient: number;
    od: string;
    do: string | null;
}