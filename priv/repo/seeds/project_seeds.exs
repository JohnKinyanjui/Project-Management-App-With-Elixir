alias ProjectManagementExample.Repo
alias ProjectManagementExample.Management.Project

Repo.insert! %Project{
  title: "Super Cool Project",
  description: "This is the best project ever"
}

Repo.insert! %Project{
  title: "Kind Cool Project",
  description: "This project is the best known for being project"
}

Repo.insert! %Project{
  title: "Lamest Project",
  description: "This is the worst project ever"
}
