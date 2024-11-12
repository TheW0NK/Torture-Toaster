const memoryHog = () => {
    const garbage = [];
    const addGarbage = () => {
        try {
            garbage.push(new Array(10000000).fill(Math.random()));
            console.log(`Allocated ${garbage.length * 10000000 * 8 / (1024 * 1024)} MB`);
        } catch (e) {
            console.error('Memory allocation failed:', e);
        }
        setTimeout(addGarbage, 100); // Increased delay to 100ms
    };
    addGarbage();
};

const cpuHog = () => {
    const start = Date.now();
    while (Date.now() - start < 10000) { // Run for 10 seconds
        Math.sqrt(Math.random());
    }
    setTimeout(cpuHog, 100); // Increased delay to 100ms
};

memoryHog();
cpuHog();