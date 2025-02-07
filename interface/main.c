#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

void usage()
{
  printf("Usage: snow {update|clean|list|rollback|dev}\n");
  exit(1);
}

void update()
{
  printf("Updating setup...\n");

  // Compile the program
  int compile_result = system("gcc -o snow ~/.config/nix/interface/main.c");
  if (compile_result == 0)
  {
    printf("Compilation successful.\n");

    int move_result = system("sudo mv snow /usr/local/bin/");
    if (move_result == 0)
    {
      printf("Executable moved successfully.\n");
    }
    else
    {
      printf("Failed to move the executable.\n");
    }
  }
  else
  {
    printf("Compilation failed.\n");
  }

  // Nix command
  system("nix run nix-darwin --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake ~/.config/nix");
}

void clean()
{
  printf("Cleaning up garbage...\n");
  system("nix-collect-garbage -d");
}

void list()
{
  printf("Listing installed packages...\n");
  system("nix-env -q");
}

void rollback()
{
  printf("Rolling back environment...\n");
  system("nix-env --rollback");
}

void dev(char *template)
{
  // Check that flake.nix does not already exist
  char *projectDir = getcwd(NULL, 0);

  // Set up paths
  char flakePath[256];
  snprintf(flakePath, sizeof(flakePath), "%s/flake.nix", projectDir);

  if (access(flakePath, F_OK) == 0)
  {
    printf("flake.nix already exists in the project directory. Aborting.\n");
    free(projectDir);
    exit(1);
  }

  // Copy template flake.nix over
  char templatePath[256];
  if (template != NULL)
  {
    // Use templated dev.nix
    snprintf(templatePath, sizeof(templatePath), "~/.config/nix/interface/templates/dev-%s.nix", template);
  }
  else
  {
    // Use default dev.nix
    snprintf(templatePath, sizeof(templatePath), "~/.config/nix/interface/templates/dev.nix");
  }

  // Copy it over
  char command[512];
  snprintf(command, sizeof(command), "cp %s %s", templatePath, flakePath);
  system(command);

  // Add to git
  system("git add flake.nix");

  // Set up direnv
  snprintf(command, sizeof(command), "echo 'use flake' > %s/.envrc && direnv allow", projectDir);
  system(command);

  printf("Setup completed successfully.\n");

  free(projectDir);
  // free(scriptDir);
}

int main(int argc, char *argv[])
{
  if (argc < 2)
  {
    usage();
  }

  char *command = argv[1];
  char *template = NULL;

  if (strcmp(command, "update") == 0)
  {
    update();
  }
  else if (strcmp(command, "dev") == 0)
  {
    // Check for args passed
    if (argc > 3 && strcmp(argv[2], "--template") == 0)
    {
      template = argv[3];
    }
    dev(template);
  }
  else
  {
    printf("Error: Unknown command '%s'\n", command);
    usage();
  }

  return 0;
}
