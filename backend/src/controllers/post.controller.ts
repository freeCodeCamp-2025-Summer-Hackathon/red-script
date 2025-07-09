import { Request, Response } from "express";
import { PostRepository } from "../repositories/post.repository";
import { Prisma } from "../../generated/prisma";

export const getAllPosts = async (req: Request, res: Response) => {
  try {
    const posts = await PostRepository.findAll();
    res.json(posts);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to fetch posts" });
  }
};

export const getPostById = async (req: Request, res: Response) => {
  try {
    const postId = parseInt(req.params.id);
    const post = await PostRepository.findById(postId);
    if (!post) {
      res.status(404).json({ error: "Post not found" });
      return;
    }
    res.json(post);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to fetch post" });
  }
};

export const createPost = async (req: Request, res: Response) => {
  try {
    const userId = (req as any).user?.id;
    if (!userId) {
      res.status(401).json({ error: "Unauthorized" });
      return;
    }

    const postData = req.body as Omit<Prisma.PostsCreateInput, "user">;

    const newPost = await PostRepository.create({
      ...postData,
      user: { connect: { id: userId } },
    });

    res.status(201).json(newPost);
    return;
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to create new post" });
  }
};

export const updatePost = async (req: Request, res: Response) => {
  try {
    const postId = parseInt(req.params.id);
    const postData = req.body as Prisma.PostsUpdateInput;
    const updatedPost = await PostRepository.update(postId, postData);
    res.json(updatedPost);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to update post" });
  }
};

export const deletePost = async (req: Request, res: Response) => {
  try {
    const postId = parseInt(req.params.id);
    await PostRepository.delete(postId);
    res.sendStatus(204);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to delete post" });
  }
};
