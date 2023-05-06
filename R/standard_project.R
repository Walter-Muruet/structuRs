#' A General, Standardised Project Structure
#'
#' My personalised version of the project structure suggested by Noble WS, 2009
#'  and Cookiecutter data science.
#'
#' @importFrom purrr walk
#'
#' @param path A character string. Specifies path/to/project/directory.
#'
#' @returns A new project directory with a standardised folder structure.
#'
#' @noRd
standard_project <- function(path) {

  # Create project directory
  dir.create(path, showWarnings = FALSE, recursive = TRUE)

  # Create Data, Src, Models, Notebooks, References and Submissions Folders
  purrr::walk(c("Data", "Src", "Models", "Notebooks", "References", "Outputs"),
              function(x) dir.create(paste(path, x, sep = "/"),
                                     showWarnings = FALSE,
                                     recursive = TRUE))

  # Create Data subfolders
  purrr::walk(c("External", "Interim", "Processed", "Raw", "Test"),
              function(x) dir.create(paste(path,"Data", x, sep = "/"),
                                     showWarnings = FALSE,
                                     recursive = TRUE))
  # Create Src subfolders
  purrr::walk(c("Python", "R"),
              function(x) dir.create(paste(path,"Src", x, sep = "/"),
                                     showWarnings = FALSE,
                                     recursive = TRUE))

  # Create Outputs subfolders
  purrr::walk(c("Figures", "Tables", "Reports", "Misc"),
              function(x) dir.create(paste(path,"Reports", x, sep = "/"),
                                     showWarnings = FALSE,
                                     recursive = TRUE))

  # .here file for pyhere
  file.create(".here", showWarnings = FALSE)

  # README.md file template
  system.file("extdata", "README.md", package = "structuRs")
  file.copy(from = system.file("extdata", "README.md", package = "structuRs"),
            to = path,
            recursive = TRUE)
}
