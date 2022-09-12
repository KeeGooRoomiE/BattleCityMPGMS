
if (global.tactive= "TANKS")
{
	if (bttype=="R" and global.nftpage<1){global.nftpage+=1}
	else if (bttype=="L" and global.nftpage>1){global.nftpage-=1}
}

if (global.tactive= "PRO")
{
	if (bttype=="R" and global.nftpage<1){global.nftpage+=1}
	else if (bttype=="L" and global.nftpage>1){global.nftpage-=1}
}

if (global.tactive= "NFTs")
{
	if (bttype=="R" and global.nftpage<4){global.nftpage+=1}
	else if (bttype=="L" and global.nftpage>1){global.nftpage-=1}
}
