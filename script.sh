lambdaFunctionName="simplelambda"
echo "Cleaning up the current file"
rm -f $lambdaFunctionName-*
generatedFileName=$lambdaFunctionName"-"$(uuid | cut -d'-' -f 1)".zip"
cd $lambdaFunctionName
zip -r ../$generatedFileName .
cd ..
echo "Verify the files being uploaded to Lambda"
unzip -l $generatedFileName
echo "Update Function Code with new ZIP file"
aws lambda update-function-code --function-name  $lambdaFunctionName --zip-file fileb://$generatedFileName