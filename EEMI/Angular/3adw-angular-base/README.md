## Créer une todo-list :

- Afficher la liste des tâches et un bouton ajout tâche
- Pouvoir ajouter une tâche : (/new-task)
    - champ texte
    - priorité (select : urgent, normal, bas)
    - bouton ajout
- Pouvoir supprimer une tâche
- Pouvoir modifier une tâche (/task/{id})

### Côté Angular :
- Créer un service qui va récupérer / ajouter / modifier / supprimer une tâche et enregistrer la donnée dans le localStorage.
- Utiliser bootstrap ou material uniquement en l’installant via npm (pas de cdn)
- Créer les routes nécessaires
