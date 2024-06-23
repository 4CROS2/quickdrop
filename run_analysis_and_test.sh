run_analyzer=true
run_tests=true

while [[ $# -gt 0 ]]
do
    key="$1"

    case $key in
        -tests|--only-tests)
        run_analyzer=false
        shift
        ;;
        -metrics|--only-code-metrics)
        run_tests=false
        shift
        ;;
        *)    # Unkown flag
        echo "Usage: run_analysis_and_tests.sh [-tests|--only-tests] [-metrics|--only-code-metrics]"
        exit 1
        ;;
    esac
done

if [ "$run_analyzer" = true ]; then
    echo "Running dart_code_metrics..."
    dart run dart_code_metrics:metrics check-unused-files lib
    dart run dart_code_metrics:metrics check-unused-code lib lib/src lib/main.dart
fi

if [ "$run_tests" = true ]; then
    echo "Running tests..."
    flutter test
fi