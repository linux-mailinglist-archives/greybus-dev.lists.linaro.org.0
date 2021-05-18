Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 523CF38786F
	for <lists+greybus-dev@lfdr.de>; Tue, 18 May 2021 14:05:43 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3760161020
	for <lists+greybus-dev@lfdr.de>; Tue, 18 May 2021 12:05:42 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id A7EEE610C5; Tue, 18 May 2021 12:05:41 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5E2986101A;
	Tue, 18 May 2021 12:05:38 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DBE4F61009
 for <greybus-dev@lists.linaro.org>; Tue, 18 May 2021 12:05:36 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D9C5161019; Tue, 18 May 2021 12:05:36 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by lists.linaro.org (Postfix) with ESMTPS id CAF6B61009
 for <greybus-dev@lists.linaro.org>; Tue, 18 May 2021 12:05:34 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IC1kA4009644; Tue, 18 May 2021 12:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=v/C7sk4g6ZmfKo3L4Pn/9AdcXHZUnCVvxhxlWgHNpps=;
 b=XsNG1TTwq7ugZ+wXE+A8xDRY1akJNwGlLSsP6TsYLxF3EKQMNxCgFID8W6qA2xCNfUzU
 t4aox/3LjqNrtTD6Ee1gPF4VGzcVi3AOUNZipnnKYhhts77s5F/pla4qap3VWuRo6V4c
 le0Cz1hd9y7pK7W54eVpIGFyO1iHhahl32qc9G3e9INcE5oqQu9VKLSs4k1+ZtSiUP9K
 hXM7QO1YFoFjs9Cvg+oziw9NoRfO0536QRcO7uC6JUZ95X5H7dK+nzF3OaFjW+NpnqRA
 IiVH+QVBCNSIuMYSE0CSFUS+uUS+Vbe733gyb9LI7dZ9W3ebYa92Hwo8nfbykMYjRp7+ aA== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 38kh0h8mtu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 12:05:30 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14IBvlnd060870;
 Tue, 18 May 2021 12:05:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 38kb37w44n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 12:05:29 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14IC5TMc074128;
 Tue, 18 May 2021 12:05:29 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 38kb37w44c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 12:05:29 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14IC5RIR023079;
 Tue, 18 May 2021 12:05:27 GMT
Received: from kadam (/62.8.83.26) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 18 May 2021 05:05:26 -0700
Date: Tue, 18 May 2021 15:05:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Wang Qing <wangqing@vivo.com>
Message-ID: <20210518120519.GP1955@kadam>
References: <1621338514-11577-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1621338514-11577-1-git-send-email-wangqing@vivo.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: 5aHPNJYmuvZOpbWV8gf-z7ooHBVz97WM
X-Proofpoint-ORIG-GUID: 5aHPNJYmuvZOpbWV8gf-z7ooHBVz97WM
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fix some formatting
 issues
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
Cc: Alex Elder <elder@kernel.org>, linux-staging@lists.linux.dev,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, May 18, 2021 at 07:48:34PM +0800, Wang Qing wrote:
> fixing WARNING: void function return statements are not generally useful
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  drivers/staging/greybus/audio_codec.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index b589cf6..ffd8997
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -1028,7 +1028,6 @@ static int gbcodec_probe(struct snd_soc_component *comp)
>  static void gbcodec_remove(struct snd_soc_component *comp)
>  {
>  	/* Empty function for now */
> -	return;
>  }

This is called from snd_soc_component_remove().  Just delete the whole
function.  It's unclear why there are so many dummy functions in this
driver...

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
