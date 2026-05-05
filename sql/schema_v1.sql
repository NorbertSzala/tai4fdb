PRAGMA foreign_keys = ON;
CREATE TABLE IF NOT EXISTS organisms (
    organism_id INTEGER PRIMARY KEY,
    full_scientific_name TEXT NOT NULL,
    shortened_name TEXT,
    strain TEXT,
    taxon_id INTEGER,
    lifestyle TEXT,
    source_database TEXT notes TEXTS,
    UNIQUE(full_scientific_name, strain, organism_id)
);
CREATE TABLE IF NOT EXISTS assemblies (
    assembly_id integer PRIMARY KEY,
    organism_id integer NOT NULL,
    assembly_accession text,
    assembly_name text,
    genome_version integer,
    genetic_code_id integer,
    source text,
    date_imported text
);
CREATE TABLE sequence_files (
    file_id INTEGER PRIMARY KEY,
    assembly_id INTEGER NOT NULL,
    file_type TEXT NOT NULL,
    path TEXT NOT NULL,
    sha256 TEXT NOT NULL,
    imported_at TEXT NOT NULL,
    FOREIGN KEY (assembly_id) REFERENCES assemblies(assembly_id)
);
CREATE TABLE IF NOT EXISTS cds (
    cds_id integer PRIMARY KEY,
    assembly_id integer NOT NULL,
    sequence_id text NOT NULL,
    gene_id int,
    sequence text NOT NULL,
    product text,
    length_nt integer,
    length_aa integer,
    gc_content real,
    gc3_content real,
    internatl STOP text,
    chr_cont text,
    start_pos integer,
    end_pos integer,
    strand integer has_internal_stop boolean NOT NULL DEFAULT 0,
    ambigous_bases_count integer NOT NULL DEFAULT 0,
    FOREIGN KEY (assembly_id) REFERENCES assemblies(assembly_id),
    UNIQUE(assembly_id, sequence_id)
);
CREATE TABLE IF NOT EXISTS trna_genes ();
CREATE TABLE IF NOT EXISTS codon_weights ();
CREATE TABLE IF NOT EXISTS codon_counts ();
CREATE TABLE IF NOT EXISTS tai_results ();
CREATE TABLE IF NOT EXISTS analysis_results ();
CREATE TABLE IF NOT EXISTS trnascanse_results ();