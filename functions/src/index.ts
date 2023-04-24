import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();

exports.sendMessage = functions.https.onCall(async (data, context) => {
  const resultUsers = await admin.firestore().collection("Users")
    .where("uid", "==", context.auth?.uid).get();
  if (resultUsers.docs.length > 0) {
    const record = resultUsers.docs[0].data();
    admin.firestore().collection("Messages").add(
      {
        uid: context.auth?.uid,
        name: record.name,
        nickName: record.nickName,
        message: data.message,
        createAt: admin.firestore.Timestamp.now(),
      }
    );
  }
});
