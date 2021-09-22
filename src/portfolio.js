const header = {
  // all the properties are optional - can be left empty or deleted
  homepage: 'https://marinn17.github.io',
  title: 'MC.',
}

const about = {
  // all the properties are optional - can be left empty or deleted
  name: 'Marinn Cedillo',
  role: 'Software Engineer',
  description:
    'A recent graduate from Wellesley College, I studied Media Arts and Sciences (a fancy name for Computer Science and Media Studies) with a minor in Education. Currently based in Sunnyvale, CA.',
  // resume: 'https://example.com',
  social: {
    linkedin: 'https://linkedin.com/in/marinn-cedillo',
    github: 'https://github.com/marinn17',
  },
}

const projects = [
  // projects can be added an removed
  // if there are no projects, Projects section won't show up
  // {
  //   name: 'Tic Tac Toe',
  //   description:
  //     'Amet asperiores et impedit aliquam consectetur? Voluptates sed a nulla ipsa officia et esse aliquam',
  //   stack: ['Javascript'],
  //   sourceCode: 'https://github.com',
  //   livePreview: 'https://github.com',
  // },
  {
    name: 'ReFresh',
    description:
      'Redesign of the Wellesley College online menu to improve community and accessibility.',
    stack: ['JavaScript', 'HTML', 'CSS'],
    sourceCode: 'https://github.com/marinn17/refresh_prototype',
    // livePreview: 'https://github.com',
  },
  {
    name: 'Ambi',
    description:
      'Ambi is a tangible user interface meant to keep track of the emotional state of the user and increase social connectedness without the use of a screen.',
    stack: ['C++', 'Arduino'],
    sourceCode: 'https://github.com/sbarlow2/ambi',
    livePreview: 'https://sbarlow2.github.io/ambi/',
  },
]

const skills = [
  // skills can be added or removed
  // if there are no skills, Skills section won't show up
  'Java',
  'HTML',
  'CSS',
  'JavaScript',
  'Git',
  'Python',
]

const contact = {
  // email is optional - if left empty Contact section won't show up
  email: 'cedillo.marinn@mail.com',
}

export { header, about, projects, skills, contact }
