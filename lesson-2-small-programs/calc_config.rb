require 'i18n'

I18n.backend.store_translations(:en, {
  greeting: "Welcome to the Calculator! Enter your name:",
  valid_name: "Make sure to enter a valid name.",
  get_num1: "What's the first number?",
  nonvalid_num: "That's not a valid number, try again.",
  get_num2: "What's the second number?",
  nonvalid_op: "Must choose 1, 2, 3 or 4",
  another_op?: "Do you want to perform another calculation? (Y to calculate again)",
  closing: "Thanks for using the calculator!"
})

I18n.backend.store_translations(:fr, {
  greeting: "Bienvenue dans la calculatrice ! Entrez votre nom :",
  valid_name: "Assurez-vous d'entrer un nom valide.",
  get_num1: "Quel est le premier nombre ?",
  nonvalid_num: "Ce n'est pas un nombre valide, réessayez.",
  get_num2: "Quel est le deuxième nombre ?",
  nonvalid_op: "Il faut choisir 1, 2, 3 ou 4",
  another_op?: "Voulez-vous effectuer un autre calcul ? (Y pour recalculer)",
  closing: "Merci d'avoir utilisé la calculatrice !"
})