
rule preprocess_data:
    input:
        R="workflow/scripts/preproc.R",
        csv=config['dataset']
    output:
        rds='data/dat_proc.Rds'
    log:
        "log/preprocess_data.txt"
    benchmark:
        "benchmarks/preprocess_data.txt"
    params:
        outcome_colname=outcome_colname
    threads: ncores
    resources:
        mem_mb = MEM_PER_GB * 2
    conda: '../envs/mikropml.yml'
    script:
        "workflow/scripts/preproc.R"

rule run_ml:
    input:
        R="workflow/scripts/ml.R",
        rds=rules.preprocess_data.output.rds
    output:
        model="results/runs/{method}_{seed}_model.Rds",
        perf=temp("results/runs/{method}_{seed}_performance.csv"),
        feat=temp("results/runs/{method}_{seed}_feature-importance.csv")
    log:
        "log/runs/run_ml.{method}_{seed}.txt"
    benchmark:
        "benchmarks/runs/run_ml.{method}_{seed}.txt"
    params:
        outcome_colname=outcome_colname,
        method="{method}",
        seed="{seed}",
        kfold=kfold
    threads: ncores
    resources:
        mem_mb = MEM_PER_GB * 4
    conda: '../envs/mikropml.yml'
    script:
        "workflow/scripts/ml.R"
