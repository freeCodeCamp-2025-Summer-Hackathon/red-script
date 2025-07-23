import {prisma} from "../config/prisma";
import {Posts} from '../Models/Posts'

const findAll = async () => {
    return await prisma.posts.findMany({
        select: {
            guid: true,
            title: true,
            description: true,
            isActive: true,
            createdOn: true,
            user: true,
        },
    });
};

const findOne = async (postID: string) => {
    return await prisma.posts.findUnique({
        where: {
            guid: postID,
        },
    });
};

const findMany = async (filterParams: {[key: string]: any}) => {
    filterParams.isActive = true;
   return await prisma.posts.findMany({
    where: filterParams
   });
};

const deletePost = async (postID: string) => {
    return await prisma.posts.update({
        where: {
            guid: postID
        },
        data: {
            isActive: false
        },
    });
};




export {findAll, deletePost, findOne, findMany};