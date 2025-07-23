import {Request, Response} from 'express';
import * as PostsService from '../services/posts.service';

const getAllPosts = async (req: Request, res: Response) => {

    if (Object.keys(req.query).length === 0) {
        try {
        const posts = await PostsService.getAllPosts();
        res.json(posts);
        res.status(200);
    } catch (error) {
        res.status(500).json({message: 'Internal server error getting posts'});
      }
    } else {
         type filterParams = {
            [key: string]: any
        }
        const filterParams: filterParams
         = {};

        if ('type' in req.query) {
            filterParams["type"] = {contains: req.query.type};
        } else if ('offers' in req.query) {
            filterParams["offers"] = {contains: req.query.offers};
        } else if ('wants' in req.query) {
            filterParams["wants"] = {contains: req.query.wants};
        } else if ('tags' in req.query) {
            filterParams["tags"] = {contains: req.query.tags};
        } else if ('tradeRequests' in req.query) {
            filterParams["tradeRequests"] = {contains: req.query.tradeRequest};
        }
        try {
            const posts = await PostsService.getPostsByFilters(filterParams);
            res.json(posts);
            res.status(200);
        }catch (error) {
        res.status(500).json({message: 'Internal server error getting posts'});
      }
    }
};



const getPost = async (req: Request, res: Response) => {
    if (!req.params.id) {
        res.status(500).json({message: 'Invalid postID provided, unable to delete post.'});
        return
    }

    try {
        const post = await PostsService.getPost(req.params.id);
        res.json(post);
        res.status(200);
    } catch (error) {
        res.status(500).json({message: 'Internal server error getting post'});
    }
}

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

export  {
    getAllPosts,
    getPost,
    deleteAPost
};