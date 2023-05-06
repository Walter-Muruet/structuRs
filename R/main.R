#' An interface between the package and rstudio
#'
#' This is the function that is called when the user invokes the New Project
#'  wizard using the project template defined in the template file at:
#'  inst/rstudio/templates/project/cookiecutted.dcf
#'
#'
#' @importFrom purrr walk
#'
#' @param path A character string. Specifies path/to/project/directory.
#' @param project_type The type of project to be created. See notes for
#'  currently available project types.
#'
#' @returns A new project directory with a standardised folder structure.
#'
#' @note
#' Currently available project types:
#' * Standard Project (standard_project)
#' * Kaggle Competition (kaggle_competition)
#'
#' @export
main <- function(path,project_type) {
  do.call(project_type, list(path = path))
}
