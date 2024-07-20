import { useState, useEffect } from "react";

function Landing() {
    const [greeting, setGreeting] = useState(String);
    const [farewell, setFarewell] = useState(String);

    useEffect(() => {
        fetch(import.meta.env.VITE_API_URL_GREETING_ENDPOINT)
            .then((response) => response.text())
            .then((text) => setGreeting(
                JSON.parse(text)
            ))
            .catch((error) => {
                console.error(error);
                setGreeting("Error fetching data");
            });
    }, []);

    useEffect(() => {
        fetch(import.meta.env.VITE_API_URL_FAREWELL_ENDPOINT)
            .then((response) => response.text())
            .then((text) => setFarewell(
                JSON.parse(text)
            ))
            .catch((error) => {
                console.error(error);
                setGreeting("Error fetching data");
            });
    }, []);

    return (
        <div className="flex justify-center bg-gray-100 h-screen items-center">
            <div className="text-gray-800 text-center bg-gray-300 px-4 py-2 m-2">
                <h1 className="text-lg font-semibold">Greeting</h1>
                { greeting ? <pre>{ greeting }</pre> : 'Loading...' }
            </div>

            <div className="text-gray-800 text-center bg-gray-300 px-4 py-2 m-2">
                <h1 className="text-lg font-semibold">Farewell</h1>
                { farewell ? <pre>{ farewell }</pre> : 'Loading...' }
            </div>
        </div>
    );

}

export default Landing