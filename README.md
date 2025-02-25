# Run mikropml with snakemake <img src='figures/mikropml-snakemake-workflow.png' align="right" height="120" />

<!--[![tests](https://github.com/SchlossLab/mikropml-snakemake-workflow/actions/workflows/tests.yml/badge.svg)](https://github.com/SchlossLab/mikropml-snakemake-workflow/actions/workflows/tests.yml)-->
[![build](https://github.com/SchlossLab/mikropml-snakemake-workflow/actions/workflows/build.yml/badge.svg)](https://github.com/SchlossLab/mikropml-snakemake-workflow/actions/workflows/build.yml)
[![tests](https://github.com/SchlossLab/mikropml-snakemake-workflow/actions/workflows/tests.yml/badge.svg)](https://github.com/SchlossLab/mikropml-snakemake-workflow/actions/workflows/tests.yml)
[![License](https://img.shields.io/badge/license-MIT-blue)](/LICENSE.md)
[![DOI](https://zenodo.org/badge/292886119.svg)](https://zenodo.org/badge/latestdoi/292886119)

[Snakemake](https://snakemake.readthedocs.io/en/stable) is a workflow manager
that enables massively parallel and reproducible
analyses.
Snakemake is a suitable tool to use when you can break a workflow down into
discrete steps, with each step having input and output files.

[mikropml](http://www.schlosslab.org/mikropml/) is an R package for supervised machine learning pipelines.
We provide this example workflow as a template to get started running mikropml with snakemake.
We hope you then customize the code to meet the needs of your particular ML task.

For more details on these tools, see the
[Snakemake tutorial](https://snakemake.readthedocs.io/en/stable/tutorial/tutorial.html)
and read the [mikropml docs](http://www.schlosslab.org/mikropml/).

## The Workflow

The [`Snakefile`](workflow/Snakefile) contains rules which define the output files we want and how to make them.
Snakemake automatically builds a directed acyclic graph (DAG) of jobs to figure
out the dependencies of each of the rules and what order to run them in.
This workflow preprocesses the example dataset, calls `mikropml::run_ml()`
for each seed and ML method set in the config file,
combines the results files, plots performance results
(cross-validation and test AUROCs, hyperparameter AUROCs from cross-validation, and benchmark performance),
and renders a simple [R Markdown report](report.Rmd) as a GitHub-flavored markdown file ([see example here](report-example.md)).

<!-- snakemake make_graph_figures -->
![rulegraph](figures/graphviz/rulegraph.png)

The DAG shows how calls to `run_ml` can run in parallel if
snakemake is allowed to run more than one job at a time.
If we use 100 seeds and 4 ML methods, snakemake would call `run_ml` 400 times.
Here's a small example DAG if we were to use only 2 seeds and 1 ML method:

<!-- snakemake make_graph_figures -->
![dag](figures/graphviz/dag.png)

## Usage

Full usage instructions recommended by snakemake are available in the 
[snakemake workflow catalog](https://snakemake.github.io/snakemake-workflow-catalog/?usage=SchlossLab/mikropml-snakemake-workflow).
Snakemake recommends using `snakedeploy` to use this workflow as a module in 
your own project.

Alternatively, you can download this repo and modify the code 
directly to suit your needs. See instructions [here](/quick-start.md).

## Help & Contributing

If you come across a bug, [open an
issue](https://github.com/SchlossLab/mikropml-snakemake-workflow/issues)
and include a minimal reproducible example.

If you have questions, create a new post in
[Discussions](https://github.com/SchlossLab/mikropml-snakemake-workflow/discussions).

If you’d like to contribute, see our guidelines
[here](.github/CONTRIBUTING.md).

## Code of Conduct

Please note that the mikropml-snakemake-workflow is released with a
[Contributor Code of Conduct](.github/CODE_OF_CONDUCT.md).
By contributing to this project, you agree to abide by its terms.

## More resources

- [mikropml docs](http://www.schlosslab.org/mikropml/)
- [Snakemake tutorial](https://snakemake.readthedocs.io/en/stable/tutorial/tutorial.html)
- [conda user guide](https://docs.conda.io/projects/conda/en/latest/user-guide/getting-started.html)
