## Synapse faceted search

A searchable table of raw and processed data files using Synapse annotations.

### Running

To run, fork or clone this repository, or:

```
library(shiny)
shiny::runGitHub("Sage-Bionetworks/SynapseShinyFacetedSearch")
```

### Requirements

See http://rstudio.github.io/DT/ for details.

Requires `shiny 0.11`:

```
devtools::install_github("rstudio/shiny")
```

Also, requires the development version of `DT`.

```
devtools::install_github('ramnathv/htmlwidgets')
devtools::install_github("rstudio/DT")
```

