#' Ho Chi Minh City shapefiles data
#'
#' A list of shapefiles (as `sf` objects) for Ho Chi Minh City
#'
#' @format ## `hcmc_shapefiles`
#' A named list with 5 objects
#' \describe{
#'   \item{district_24}{24 districts in HCM city (during 2003 - 2021)}
#'   \item{commune_322}{322 communes in HCM city (during 2003 - 2021)}
#'   \item{commune_312}{312 communes in HCM city (during 2021 - 2023)}
#'   \item{commune_168}{168 communes in HCM city (after 2025 reform)}
#'   \item{commune_167_mainland}{Same as `commune_168` but only mainland
#' communes (no Con Dao island)}
#' }
#'
#' @source Derived from <https://quingzz.github.io/hcmc_geo_change/>
"hcmc_shapefiles"
