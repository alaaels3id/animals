import 'package:flutter/material.dart';

class AnimalStat {
  final String label;
  final String value;
  final IconData icon;

  const AnimalStat({
    required this.label,
    required this.value,
    required this.icon,
  });
}

class Character {
  final String name;
  final String subtitle;
  final String imgPath;
  final String description;
  final List<Color> colors;
  final String diet;
  final String lifespan;
  final String speed;
  final String weight;
  final String habitat;
  final List<String> facts;

  const Character({
    required this.name,
    required this.subtitle,
    required this.imgPath,
    required this.description,
    required this.colors,
    required this.diet,
    required this.lifespan,
    required this.speed,
    required this.weight,
    required this.habitat,
    required this.facts,
  });

  List<AnimalStat> get stats => [
        AnimalStat(label: 'Speed', value: speed, icon: Icons.speed_rounded),
        AnimalStat(
            label: 'Lifespan', value: lifespan, icon: Icons.timer_outlined),
        AnimalStat(label: 'Diet', value: diet, icon: Icons.restaurant_rounded),
        AnimalStat(label: 'Weight', value: weight, icon: Icons.scale_rounded),
        AnimalStat(
            label: 'Habitat', value: habitat, icon: Icons.forest_rounded),
      ];
}

final List<Character> characters = [
  Character(
    name: "Black Panther",
    subtitle: "Rainforest Apex Predator",
    imgPath: "assets/images/Panther.png",
    description:
        "Melanism in the jaguar is conferred by a dominant allele, and in the leopard (Panthera pardus) by a recessive allele. Close examination of the colour of these black cats will show that the typical markings are still present, but are hidden by the excess black pigment melanin, giving an effect similar to that of printed silk. This is called ghost striping. Melanistic and non-melanistic animals can be littermates. It is thought that melanism may confer a selective advantage under certain conditions since it is more common in regions of dense forest, where light levels are lower.",
    colors: [Colors.orange.shade300, Colors.deepOrange.shade600],
    diet: "Carnivore",
    lifespan: "12 - 15 Years",
    speed: "88 km/h",
    weight: "56 - 96 kg",
    habitat: "Tropical Rainforests",
    facts: [
      "Can leap up to 20 feet horizontally to ambush prey.",
      "Their 'ghost markings' are visible under direct bright sunlight.",
      "Excellent swimmers who enjoy cooling off in jungle rivers.",
    ],
  ),
  Character(
    name: "Shadow Leopard",
    subtitle: "Solitary Night Stalker",
    imgPath: "assets/images/Panther.png",
    description:
        "A black panther is the melanistic colour variant of the leopard or the jaguar. Black panthers of both species have excess black pigments, but their typical rosettes are still present. In Africa and Asia, black panthers are leopards (Panthera pardus), and in the Americas they are black jaguars (Panthera onca). They are exceptionally agile tree climbers, frequently hoisting prey weighing more than themselves up into tall tree branches.",
    colors: [Colors.teal.shade300, Colors.green.shade700],
    diet: "Carnivore",
    lifespan: "14 - 17 Years",
    speed: "58 km/h",
    weight: "37 - 90 kg",
    habitat: "Dense Cloud Forests",
    facts: [
      "Possesses unmatched stealth and exceptional night vision.",
      "Can carry carcasses heavier than itself high up into trees.",
      "Mostly solitary animals with large established hunting territories.",
    ],
  ),
  Character(
    name: "Water Buffalo",
    subtitle: "Riverine Herbivore",
    imgPath: "assets/images/Buffalo.png",
    description:
        "The skin of river buffalo is black, but some specimens may have dark, slate-coloured skin. Swamp buffalo have a grey skin at birth, but become slate blue later. Albinoids are present in some populations. River buffalo have comparatively longer faces, smaller girths, and bigger limbs than swamp buffalo. Their dorsal ridges extend further back and taper off more gradually. Their horns grow downward and backward, then curve upward in a spiral.",
    colors: [Colors.pink.shade300, Colors.redAccent.shade400],
    diet: "Herbivore",
    lifespan: "25 - 30 Years",
    speed: "48 km/h",
    weight: "550 - 1000 kg",
    habitat: "Wetlands & Swamps",
    facts: [
      "Spends up to 80% of daylight hours wallowing in water or mud.",
      "Crescent horns can reach a span of more than 5 feet.",
      "Known as the 'living tractor of the East' for centuries.",
    ],
  ),
  Character(
    name: "Cape Buffalo",
    subtitle: "Savannah Heavyweight",
    imgPath: "assets/images/Buffalo.png",
    description:
        "The African buffalo or Cape buffalo is a large Sub-Saharan African bovine. It is not closely related to the slightly larger wild water buffalo of Asia. Its aggressive temperament means it has never been domesticated and it is widely regarded as one of the most dangerous animals on the African continent, having very few natural predators aside from lions and large crocodiles.",
    colors: [Colors.deepPurple.shade300, Colors.indigo.shade700],
    diet: "Herbivore",
    lifespan: "18 - 22 Years",
    speed: "56 km/h",
    weight: "500 - 900 kg",
    habitat: "Savannahs & Woodlands",
    facts: [
      "Their fused horn bases form a continuous bone shield called a 'boss'.",
      "Known to fiercely protect fellow herd members from lion prides.",
      "Possesses an acute sense of smell and hearing across long distances.",
    ],
  ),
];
