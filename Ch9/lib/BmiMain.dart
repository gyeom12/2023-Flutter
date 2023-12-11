import 'package:ch08/BmiResult.dart';
import 'package:flutter/material.dart';

class BmiMain extends StatefulWidget {
  const BmiMain({super.key});

  @override
  State<BmiMain> createState() => _BmiMainState();
}

class _BmiMainState extends State<BmiMain> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  void dispose(){
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('비만도 계산기'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '키'
                ),
                keyboardType: TextInputType.number,
                controller: _heightController,
                validator: (value){
                  if(value!.trim().isEmpty){
                    return '키 값을 입력하세요';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '몸무게'
                ),
                keyboardType: TextInputType.number,
                controller: _weightController,
                validator: (value){
                  if(value!.trim().isEmpty){
                    return '몸무게 값을 입력하세요';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(top:16.0),
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context)=>BmiResult(
                            height: double.parse(_heightController.text.trim()),
                            weight: double.parse(_weightController.text.trim())
                              ),
                          ),
                        );
                      }
                    },
                    child: Text('결과')
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
