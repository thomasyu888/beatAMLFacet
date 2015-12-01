## Synapse faceted search

A searchable table of raw and processed data files using Synapse annotations.

 Do *not* fork this repository directly on GitHub. Instead, please use GitHub's importer following the instructions [below](#creating-a-repository).
 
## Creating a Repository

1.  Go to [GitHub's importer][https://import.github.com/new?import_url=https://github.com/Sage-Bionetworks/SynapseShinyFacetedSearch].
1.  Click on "Check the URL".  (GitHub won't import until you've done this.)
1.  Select the owner for your new repository.
    (This will probably be you, but may instead be an organization you belong to.)
1.  Choose a name for your workshop website repository.

    You can now click "Begin Import".
    When the process is done,
    you can click "Continue to repository" to visit your newly-created repository.


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

