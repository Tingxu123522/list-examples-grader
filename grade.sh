CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

#clone the student's
git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
if [[ -f student-submission/ListExamples.java ]]; 
then
    echo "File exist"
else
    echo "ListExamples.java does not exist"
    echo "Grade: 0"
    exit 1
fi

# getting to this point
cp student-submission/ListExamples.java grading-area
cp TestListExamples.java grading-area
cp -r lib grading-area

# Then, add here code to compile and run, and do any post-processing of the

javac -cp $CPATH GradeServer.java Server.java

cd grading-area
javac $CPATH ListExamples.java TestListExamples.java
echo "This is the exit code of javac (previous command): $7."

# tests
