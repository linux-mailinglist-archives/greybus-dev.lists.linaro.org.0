Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D370388F77
	for <lists+greybus-dev@lfdr.de>; Wed, 19 May 2021 15:48:20 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 26E4C61150
	for <lists+greybus-dev@lfdr.de>; Wed, 19 May 2021 13:48:19 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 26FBA61145; Wed, 19 May 2021 13:48:17 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7CC0961146;
	Wed, 19 May 2021 13:48:15 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id BB8B5610F9
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 13:48:13 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id ADA1761145; Wed, 19 May 2021 13:48:13 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by lists.linaro.org (Postfix) with ESMTPS id 9F23A610F9
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 13:48:11 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14JDlbAw014603; Wed, 19 May 2021 13:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=hKkNxCeeV5ubpGYC5anEExFajr09TOQeCeuI5eLF1o4=;
 b=A/Xbe/NVcYXOIrDxMrZWCozalfL5ZEIhjjmTyWWw8Y+k0TwGBetos9sf1WpKICsHij5K
 E/C4AYE1lheqGgZqsAEBcfzAG5RZ0PX2mMvRw1qcVe6KIqN7PPdDt+Y4Hqv7WwYuGnET
 Tz3ks1F47fco/bTLVbBp8b86BkO6iCA3DJ5hDD9hiEGBOs3cZv1fFpCeimWoLP1D19wX
 UC62I6Ach7H5S5rIZDQOcq5XSpjyj2F7CS3JG/+IuhSrs4JncuMLmb1n7e4EOsETpBiT
 0AoatHSLYrAEbSFwOsOagoeB+HmrjcGQp5EN9AVT/AuyZFkrhgDwUfjzcX0pR/Wg6oWD XA== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 38n3dg009s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 13:48:07 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14JDm7ac158894;
 Wed, 19 May 2021 13:48:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 38mecj8e3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 13:48:07 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14JDm6Vc158734;
 Wed, 19 May 2021 13:48:06 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 38mecj8e1g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 13:48:06 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14JDm4KQ014423;
 Wed, 19 May 2021 13:48:04 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 19 May 2021 13:48:03 +0000
Date: Wed, 19 May 2021 16:47:55 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Rajat Asthana <thisisrast7@gmail.com>
Message-ID: <20210519134754.GX1955@kadam>
References: <20210519102947.GU1955@kadam>
 <20210519134119.848055-1-thisisrast7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519134119.848055-1-thisisrast7@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: vZy0g9eCQSCm3l-us7NV6EPpx2knZUYd
X-Proofpoint-GUID: vZy0g9eCQSCm3l-us7NV6EPpx2knZUYd
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH v2] greybus: audio: Fix sparse warning.
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: elder@kernel.org, linux-staging@lists.linux.dev, johan@kernel.org,
 greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Wed, May 19, 2021 at 07:11:19PM +0530, Rajat Asthana wrote:
> Sparse complains that:
>    warning: restricted send_ctl_elem_iface_t degrades to integer.
> 
> I have looked at this code, and the code is fine as-is. Normally we
> would frown on using the __force directive to silence Sparse warnings
> but in this case it's fine. Case statements can't be made into __bitwise
> types. We also can't change the type of "ctl->iface" either because that
> is part of the user space API.
> 
> So just add a (__force int) to make the warning go away.
> 
> Signed-off-by: Rajat Asthana <thisisrast7@gmail.com>
> ---
> Changes in v2:
>     - Update the commit message.

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
