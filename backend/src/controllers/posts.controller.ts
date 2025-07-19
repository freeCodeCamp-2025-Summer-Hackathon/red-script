import {Request, Response} from 'express';
import PostsService from '../services/posts.service';

const getAllPosts = async (req: Request, res: Response) => {
    console.log("getting posts...");
    try {
        const posts = await PostsService.getAllPosts();

        const body = JSON.stringify(posts);

        res.send(body);
    } catch (error) {
        res.status(500).json({message: 'Internal server error getting posts'});
    }
};

export default {getAllPosts};