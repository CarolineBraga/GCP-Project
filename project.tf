# Project folder nested under another folder
resource "google_folder" "parent_folder" {
  display_name = var.project_id
  parent       = "folders/${var.folder_id}"
}

# Project nested under folder
resource "google_project" "project" {
  name                = var.project_id
  project_id          = var.project_id
  folder_id           = google_folder.parent_folder.id
  billing_account     = var.billing
  auto_create_network = false
}