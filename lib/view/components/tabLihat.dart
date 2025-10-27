import 'package:flutter/material.dart';
import 'package:project_uas/model/setoranSantriModel.dart';
import 'package:project_uas/viewmodel/setoranSantriViewModel.dart';

class TabLihat extends StatefulWidget {
  final String selectedIdSantri;
  const TabLihat({super.key, required this.selectedIdSantri});

  @override
  State<TabLihat> createState() => _TabLihatState();
}

class _TabLihatState extends State<TabLihat> {
  late Future<List<Setoran>> setoranList;

  @override
  void didUpdateWidget(TabLihat oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    if (oldWidget.selectedIdSantri != widget.selectedIdSantri) {
      setoranList = SetoranSantriViewModel().getSetoranSantriByIdSantri(
        widget.selectedIdSantri,
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setoranList = SetoranSantriViewModel().getSetoranSantriByIdSantri(
      widget.selectedIdSantri,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Expanded(
        child: FutureBuilder<List<Setoran>>(
          future: setoranList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  'No Setoran Found, selected id santri: ${widget.selectedIdSantri}',
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
              );
            }

            List<Setoran> setoran = snapshot.data!;

            return ListView.builder(
              itemCount: setoran.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                setoran[index].tanggal,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: setoran[index].waktu == 'subuh'
                                      ? Colors.amber.shade100
                                      : Colors.blue.shade100,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  child: Text(
                                    setoran[index].waktu == 'subuh'
                                        ? 'Subuh'
                                        : 'Malam',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: setoran[index].waktu == 'subuh'
                                          ? Colors.amber.shade700
                                          : Colors.blue.shade700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Table(
                            border: TableBorder(
                              verticalInside: BorderSide(
                                color: Colors.grey.shade700,
                              ),
                            ),
                            children: [
                              TableRow(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ayat Mulai',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 13,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                      Text(
                                        '${setoran[index].id_surah_mulai} : ${setoran[index].ayat_mulai}',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Ayat Akhir',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 13,
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                        Text(
                                          '${setoran[index].id_surah_akhir} : ${setoran[index].ayat_akhir}',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
