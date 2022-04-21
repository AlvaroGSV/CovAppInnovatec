class Question {
  final int id, danger;
  final String question;
  final List<String> answers;
  Question(
      {required this.id,
      required this.question,
      required this.answers,
      required this.danger});
}

const List sampleData = [
  {
    "id": 1,
    "question": "¿Ha tenido tos?",
    "answers": ["Si", "No"],
    "danger": 1
  },
  {
    "id": 2,
    "question": "¿Ha tenido dificultad para respirar?",
    "answers": ["Si", "No"],
    "danger": 1
  },
  {
    "id": 3,
    "question": "¿Ha tenido fiebre (37°C) o escalofríos?",
    "answers": ["Si", "No"],
    "danger": 1
  },
  {
    "id": 4,
    "question": "¿En los últimos días usted se ha sentido fatigado?",
    "answers": ["Si", "No"],
    "danger": 1
  },
  {
    "id": 5,
    "question":
        "¿En los últimos dias usted ha tenido escurrimiento o congestión nasal?",
    "answers": ["Si", "No"],
    "danger": 1
  },
  {
    "id": 6,
    "question": "¿En los últimos días usted ha tenido dolor de garganta?",
    "answers": ["Si", "No"],
    "danger": 1
  },
  {
    "id": 7,
    "question":
        "¿En los últimos días usted ha perdido el sentido del gusto o el sentido del olfato?",
    "answers": ["Si", "No"],
    "danger": 1
  },
  {
    "id": 8,
    "question": "¿En los últimos días usted ha tenido dolor de cabeza?",
    "answers": ["Si", "No"],
    "danger": 1
  },
  {
    "id": 9,
    "question": "¿En los últimos días usted ha tenido diarrea?",
    "answers": ["Si", "No"],
    "danger": 1
  },
  {
    "id": 10,
    "question":
        "¿En los últimos días usted ha tenido dolor corporal o muscular?",
    "answers": ["Si", "No"],
    "danger": 1
  },
  {
    "id": 11,
    "question": "¿En los últimos días usted ha tenido nauseas o vomito?",
    "answers": ["Si", "No"],
    "danger": 1
  },
  {
    "id": 12,
    "question":
        "¿En los últimos 14 días a estado en contacto con alguien positivo a COVID-19?",
    "answers": ["Si", "No"],
    "danger": 1
  }
];
