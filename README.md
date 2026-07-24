# AdventureWorks Sales: End-to-End Data Warehouse & OLAP Solution

The project covers the entire data pipeline architecture: from extracting data from the original relational database (OLTP), designing a Staging Area for data cleansing, and implementing a dimensional Data Warehouse, to building custom ETL workflows. Finally, it culminates in the deployment of an OLAP cube built in **C#**, enabling deep data analysis and multidimensional reporting.

## Architecture Overview

The data flow is divided into the following logical stages:

1. **Source DB:** The original transactional sales portion of the database.
2. **Staging Area (`VentasStage`):** An intermediate database designed to extract, clean, and transform data without impacting the performance of the source production system.
3. **Data Warehouse (`VentasDWH`):** A dimensional star model specifically optimized for analytical queries, consisting of sales fact tables and descriptive dimension tables.
4. **ETL Processes (`HDExtrae`, `HDCarga` & `HDTransformation`):** Logically separated routines handling the Extraction of data from the source and the Loading of transformed data into the Data Warehouse.
5. **Multidimensional Cube (`cuboOlapHDE`):** An OLAP cube developed in C# to facilitate multidimensional analysis and MDX querying of the sales data.

## Structure

* **`/docs`**: Documentation and data dictionaries/diagrams for each database model.
* **`/database`**: T-SQL scripts required to create the Staging and Data Warehouse schemas.
* **`/etl`**:
  * `/HDExtrae`: Project files for the extraction of data from the source DB.
  * `/HDTransformation`: Project files with the transformations for data types, varchar delimitations and decimal rounding.
  * `/HDCarga`: Project files for loading the cleansed and transformed data into the DWH strcuture.
* **`/olap/cuboOlapHDE`**: The C# solution containing the definition, deployment, and processing logic for the OLAP cube.
