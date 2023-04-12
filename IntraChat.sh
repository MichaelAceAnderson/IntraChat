# Note: le fichier de tchat doit être placé sur un lecteur réseau
# pour pouvoir être partagé entre plusieurs utilisateurs.
chat_file=chat.txt 

hidden=false

while true; do
    clear
    echo "Bienvenue dans IntraChat !"
    echo "Commandes:"
    echo "- exit (Quitter)"
    echo "- H (cacher le fichier log du tchat)"
    echo "- S (rétablir le fichier log du tchat)"
    echo "- (laisser vide pour mettre le tchat à jour)"
    
    if [ -f "$chat_file" ]; then
        if [ "$hidden" = true ]; then
            echo "Le fichier de tchat est invisible."
        else
            cat "$chat_file"
        fi
    else
        echo "Le fichier de tchat n'existe pas !"
    fi

    read -p "$(date +'[%Y-%m-%d - %T]') $(hostname): " msg

    case "$msg" in
        H)
            chflags hidden "$chat_file"
            hidden=true
            ;;
        S)
            chflags nohidden "$chat_file"
            hidden=false
            ;;
        exit)
            echo "Merci d'avoir utilisé IntraChat !"
            exit 0
            ;;
        "")
            continue
            ;;
        *)
            echo "$(date +'[%Y-%m-%d - %T]') $(hostname): $msg" >> "$chat_file"
            ;;
    esac
done
