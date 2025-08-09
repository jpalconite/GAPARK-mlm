// GunDB snippet - integrate into React Native app
import 'react-native-get-random-values';
import Gun from 'gun/gun';
import SEA from 'gun/sea';
const gun = Gun({ peers: ['https://your-relay.example.com/gun'] });
export async function publishEvent(node, payload){ const pair = await SEA.pair(); const signed = await SEA.sign(payload, pair); gun.get(node).set({ payload: signed, author: pair.pub, ts: new Date().toISOString() }); }
