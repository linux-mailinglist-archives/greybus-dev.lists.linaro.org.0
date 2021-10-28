Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id A24DF43E65B
	for <lists+greybus-dev@lfdr.de>; Thu, 28 Oct 2021 18:42:43 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4243660847
	for <lists+greybus-dev@lfdr.de>; Thu, 28 Oct 2021 16:42:42 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id B172F6090B; Thu, 28 Oct 2021 16:42:41 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7FEE46037E;
	Thu, 28 Oct 2021 16:42:38 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id D121060326
 for <greybus-dev@lists.linaro.org>; Thu, 28 Oct 2021 16:42:36 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id CF0EF6033F; Thu, 28 Oct 2021 16:42:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id B69EF60326
 for <greybus-dev@lists.linaro.org>; Thu, 28 Oct 2021 16:42:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2574060238;
 Thu, 28 Oct 2021 16:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1635439353;
 bh=nhnhDs6r4p5EaPCqcbb6JFQVDxWedPO0J85OCd8/7nQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m7N7VrJw7X062UMMNUg4E0GnT97i81zY9kp/kHyi0LO46U2eNQQhuGRtl2zO29SWj
 soUlHlKwEORzy2NB4RekAYP2K22Zb9mDka3JQRWkXcmnKmYdSOgoKQcGGnIPe8Ra0/
 RVyEnaYEL6M7bo4NacBNZlSKOjLT1/Tr5cxJ6ljM=
Date: Thu, 28 Oct 2021 18:42:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Senthu Sivarajah <ssivaraj@stud.fra-uas.de>
Message-ID: <YXrS9xwJf5AcBoFJ@kroah.com>
References: <20211028153808.9509-1-ssivaraj@stud.fra-uas.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211028153808.9509-1-ssivaraj@stud.fra-uas.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] Staging: greybus: audio_codec: changed a
 void function to return 0
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
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Oct 28, 2021 at 05:38:08PM +0200, Senthu Sivarajah wrote:
> From: Senthuran Sivarajah <ssivaraj@stud.fra-uas.de>
> 
> Fixed a coding style issue.

What coding style exactly?

> 
> Signed-off-by: Senthuran Sivarajah <ssivaraj@stud.fra-uas.de>
> 
> ---
>  drivers/staging/greybus/audio_codec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index b589cf6b1d03..9f99862791dc 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -1028,7 +1028,7 @@ static int gbcodec_probe(struct snd_soc_component *comp)
>  static void gbcodec_remove(struct snd_soc_component *comp)
>  {
>  	/* Empty function for now */
> -	return;
> +	return 0;

Did you build this change?

Exactly what tool reported a problem with this code and what was the
exact error?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
