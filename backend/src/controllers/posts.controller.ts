import {Request, Response} from 'express';
import * as PostsService from '../services/posts.service';

const getAllPosts = async (req: Request, res: Response) => {
    try {
        const posts = await PostsService.getAllPosts();
        res.json(posts);
        res.status(200);
    } catch (error) {
        res.status(500).json({message: 'Internal server error getting posts'});
    }
};

const deleteAPost = async (req: Request, res: Response) => {

    if (!req.params.id) {
        res.status(500).json({message: 'Invalid postID provided, unable to delete post.'});
        return
    }

    try {
        const deletedPost = await PostsService.deletePost(req.params.id);
        res.json({PostTitle: `${deletedPost.title}`, PostID: `${deletedPost.guid}`});
        res.status(200);
    } catch (error) {
        res.status(500).json({message: 'Internal server error deleting post'});
    }

};

export  {getAllPosts, deleteAPost};