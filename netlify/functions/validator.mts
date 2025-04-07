import { parse } from "../../netlify-vary";

export default async (req) => {
    try {
        const data = await req.json()
        const result = parse(data.netlify_vary)
        return Response.json(result);
    } catch (e) {
        return new Response(e.message, {status: 500})
    }
};

export const config = {
    method: 'GET'
}