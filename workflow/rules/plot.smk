rule plot_performance:
    input:
        R="workflow/scripts/plot_perf.R",
        csv='results/performance_results.csv'
    output:
        plot='figures/performance.png'
    log:
        "log/plot_performance.txt"
    conda: 'envs/Rtidy.yml'
    script:
        "workflow/scripts/plot_perf.R"

rule plot_hp_performance:
    input:
        R='workflow/scripts/plot_hp_perf.R',
        rds='results/hp_performance_results_{method}.Rds',
    output:
        plot='figures/hp_performance_{method}.png'
    log:
        'log/plot_hp_perf_{method}.txt'
    conda: 'envs/Rtidy.yml'
    script:
        'workflow/scripts/plot_hp_perf.R'

rule plot_benchmarks:
    input:
        R='workflow/scripts/plot_benchmarks.R',
        csv='results/benchmarks_results.csv'
    output:
        plot='figures/benchmarks.png'
    log:
        'log/plot_benchmarks.txt'
    conda: 'envs/Rtidy.yml'
    script:
        'workflow/scripts/plot_benchmarks.R'
