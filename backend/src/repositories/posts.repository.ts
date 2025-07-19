import {prisma} from "../config/prisma";

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

export {findAll, deletePost};