#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/sysinfo.h>
#include <time.h>
#include <signal.h>

volatile sig_atomic_t stop;

void handle_sigint(int sig) {
    stop = 1;
}

float get_memory_usage() {
    struct sysinfo info;
    sysinfo(&info);
    return (info.totalram - info.freeram) / (float)info.totalram * 100;
}

float get_cpu_usage() {
    FILE* file;
    unsigned long long int user, nice, system, idle, iowait, irq, softirq, steal;
    unsigned long long int total1, total2, idle1, idle2;

    file = fopen("/proc/stat", "r");
    fscanf(file, "cpu %llu %llu %llu %llu %llu %llu %llu %llu", &user, &nice, &system, &idle, &iowait, &irq, &softirq, &steal);
    fclose(file);

    total1 = user + nice + system + idle + iowait + irq + softirq + steal;
    idle1 = idle;

    sleep(1);

    file = fopen("/proc/stat", "r");
    fscanf(file, "cpu %llu %llu %llu %llu %llu %llu %llu %llu", &user, &nice, &system, &idle, &iowait, &irq, &softirq, &steal);
    fclose(file);

    total2 = user + nice + system + idle + iowait + irq + softirq + steal;
    idle2 = idle;

    return (1.0 - (idle2 - idle1) / (float)(total2 - total1)) * 100;
}

int main() {
    signal(SIGINT, handle_sigint);

    FILE *file = fopen("usage_data.txt", "w");
    if (file == NULL) {
        perror("fopen");
        return 1;
    }

    while (!stop) {
        float memory_usage = get_memory_usage();
        float cpu_usage = get_cpu_usage();

        fprintf(file, "%f %f\n", memory_usage, cpu_usage);
        fflush(file);

        sleep(5);
    }

    fclose(file);
    printf("Monitoring stopped.\n");
    return 0;
}