import 'package:daily_quote_app/daily_quote_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DailyQuotePage extends StatefulWidget {
  const DailyQuotePage({super.key});

  @override
  State<DailyQuotePage> createState() => _DailyQuotePageState();
}

class _DailyQuotePageState extends State<DailyQuotePage> {
  late DailyQuoteProvider _dailyQuoteProvider;

  void _fetchQuote() {
    _dailyQuoteProvider.fetchQuote();
  }

  @override
  Widget build(BuildContext context) {
    _dailyQuoteProvider = Provider.of<DailyQuoteProvider>(context);

    return Center(
      child: GestureDetector(
        onTap: _fetchQuote,
        child: Card(
          color: const Color.fromARGB(195, 151, 47, 39),
          elevation: 5,
          shadowColor: const Color.fromARGB(255, 133, 77, 73),
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_dailyQuoteProvider.quote != null) ...[
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.format_quote,
                          size: 150,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(_dailyQuoteProvider.quote![0].q,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.merriweather(
                                textStyle: const TextStyle(
                                    color: Colors.white, fontSize: 28),
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            "- ${_dailyQuoteProvider.quote![0].a}",
                            textAlign: TextAlign.end,
                            style: GoogleFonts.lora(
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    )
                  ] else
                    Text(
                      "Tap here to get your daily quote!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lora(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
