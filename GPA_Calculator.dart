import 'dart:io';

void main() {
    // Display welcome message
    print('=== Student Grade Calculator ===');
    print('This program helps calculate final grades based on:');
    print('- Continuous Assessment');
    print('- Exam Score');
    print('- Project Score\n');

    // Get student details
    stdout.write('Enter student name: ');
    String studentName = stdin.readLineSync()!;

    // Get scores for each component
    double continuousAssessment = getValidScore('Continuous Assessment');
    double examScore = getValidScore('Exam');
    double projectScore = getValidScore('Project');

    // Calculate total score
    double totalScore = continuousAssessment + examScore + projectScore;

    // Determine letter grade
    String letterGrade = calculateGrade(totalScore);

    // Display results
    print('\n=== Grade Report for $studentName ===');
    print('Continuous Assessment: ${continuousAssessment.toStringAsFixed(1)}');
    print('Exam Score: ${examScore.toStringAsFixed(1)}');
    print('Project Score: ${projectScore.toStringAsFixed(1)}');
    print('Total Score: ${totalScore.toStringAsFixed(1)}');
    print('Letter Grade: $letterGrade');
}

double getValidScore(String componentName) {
    double score = -1;
    while (score < 0 || score > 100) {
        stdout.write('Enter $componentName score (0-100): ');
        try {
            score = double.parse(stdin.readLineSync()!);
            if (score < 0 || score > 100) {
                print('Error: Score must be between 0 and 100. Please try again.');
            }
        } catch (e) {
            print('Error: Please enter a valid number.');
        }
    }
    return score;
}

String calculateGrade(double totalScore) {
    if (totalScore >= 80) return 'A';
    if (totalScore >= 75) return 'B+';
    if (totalScore >= 70) return 'B';
    if (totalScore >= 65) return 'C+';
    if (totalScore >= 60) return 'C';
    if (totalScore >= 55) return 'D+';
    if (totalScore >= 50) return 'D';
    if (totalScore >= 45) return 'E';
    return 'F';
}
