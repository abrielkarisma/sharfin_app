import 'package:flutter/material.dart';

class kebijakanprivasi extends StatelessWidget {
  const kebijakanprivasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          GestureDetector(
            onTap: () {},
            child: const Image(
              image: AssetImage("assets/cancel.png"),
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          const Text(
            "Kebijakan Privasi",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ]),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: SizedBox(
            width: 363,
            height: 594,
            child: Column(children: [
              Text(
                "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.",
                style: TextStyle(
                  fontFamily: "Jakarta Sans",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF4E4B66),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
                style: TextStyle(
                  fontFamily: "Jakarta Sans",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF4E4B66),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
                style: TextStyle(
                  fontFamily: "Jakarta Sans",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF4E4B66),
                ),
              )
            ])),
      ),
    );
  }
}
