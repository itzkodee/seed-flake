{
    # Define a user account. Don't forget to set a password with ‘passwd’.
    # Change name by changing 'admin' to 'joe' for example.
    users.users.itzkodee = {
        isNormalUser = true;
        description = "Welcome to workstation.";
        extraGroups = [ "networkmanager" "wheel" ]; # If something not working. Check this groups.
    };
}
