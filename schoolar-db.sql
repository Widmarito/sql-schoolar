CREATE DATABASE schoolar_db;

USE schoolar_db;

CREATE TABLE ProfessionalSchool (
    idProfessionalSchool INT,
    name VARCHAR,    
    PRIMARY KEY (idProfessionalSchool),    
);

CREATE TABLE Career (
    idCareer INT,
    name VARCHAR,
    idProfessionalSchool INT,
    PRIMARY KEY (idCareer),
    FOREIGN KEY (idProfessionalSchool) REFERENCES ProfessionalSchool(idProfessionalSchool)
);

CREATE TABLE Semester (
    idSemester INT,
    semester_code VARCHAR,
    idCareer INT,
    PRIMARY KEY (idSemester),
    FOREIGN KEY (idCareer) REFERENCES Career(idCareer)
);

CREATE TABLE Students (
    idStudent INT,
    name VARCHAR,
    lastName VARCHAR,
    phone VARCHAR,    
    email VARCHAR,
    PRIMARY KEY (idStudent),    
);

CREATE TABLE Subjects (
    idSubject INT,
    code VARCHAR,
    name VARCHAR,
    PRIMARY KEY (idSubject),    
);

CREATE TABLE Teachers (
    idTeacher INT,
    name VARCHAR,
    lastName VARCHAR,
    phone VARCHAR,    
    email VARCHAR,
    PRIMARY KEY (idTeacher),    
);

CREATE TABLE Subject_Semester (
    idSubjectSemester VARCHAR,
    idSubject INT,
    idSemester INT,
    idStudent INT,
    idTeacher INT,
    PRIMARY KEY (idSubjectSemester),
    FOREIGN KEY (idSubject) REFERENCES Subjects(idSubject),
    FOREIGN KEY (idSemester) REFERENCES Semester(idSemester),
    FOREIGN KEY (idStudent) REFERENCES Students(idStudent),
    FOREIGN KEY (idTeacher) REFERENCES Teachers(idTeacher)
);

CREATE TABLE Partials (
    idPartial INT,
    name VARCHAR,    
    score INT,
    idSubjectSemester VARCHAR,
    PRIMARY KEY (idPartial),
    FOREIGN KEY (idSubjectSemester) REFERENCES Subject_Semester(idSubjectSemester)
);

CREATE TABLE Criteria (
    idCriteria INT,
    shortName VARCHAR,
    longName VARCHAR,    
    score INT,
    idPartial INT,
    PRIMARY KEY (idCriteria),
    FOREIGN KEY (idPartial) REFERENCES Partials(idPartial)
);

CREATE TABLE Topics (
    idTopic INT,
    name VARCHAR,
    idSubjectSemester VARCHAR,
    PRIMARY KEY (idTopic),
    FOREIGN KEY (idSubjectSemester) REFERENCES Subject_Semester(idSubjectSemester)
);

CREATE TABLE Tests (
    idTest INT,
    name VARCHAR,
    typeTest VARCHAR,
    numQuestions INT,    
    idSubjectSemester VARCHAR,
    PRIMARY KEY (idTest),
    FOREIGN KEY (idSubjectSemester) REFERENCES Subject_Semester(idSubjectSemester)
);

CREATE TABLE Questions (
    idQuestion INT,
    question VARCHAR,
    keyAnswer VARCHAR,
    idTest INT,
    PRIMARY KEY (idQuestion),
    FOREIGN KEY (idTest) REFERENCES Tests(idTest)
);

CREATE TABLE Alternatives (
    idAlternative INT,
    keyAlternative VARCHAR,
    valueAlternative VARCHAR,
    isCorrect INT,
    idQuestion INT,
    PRIMARY KEY (idAlternative),
    FOREIGN KEY (idQuestion) REFERENCES Questions(idQuestion)
);

CREATE TABLE Intervals (
    idInterval INT,
    levelInterval INT,
    interval int,
);


