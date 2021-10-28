Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E122A43F53B
	for <lists+greybus-dev@lfdr.de>; Fri, 29 Oct 2021 05:08:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 50BA860B3E
	for <lists+greybus-dev@lfdr.de>; Fri, 29 Oct 2021 03:08:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 285E260B20; Fri, 29 Oct 2021 03:08:54 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DEBDC6090B;
	Fri, 29 Oct 2021 03:08:50 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 3A8C860326
 for <greybus-dev@lists.linaro.org>; Thu, 28 Oct 2021 17:19:31 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 2FF2F6033F; Thu, 28 Oct 2021 17:19:31 +0000 (UTC)
Received: from klopfer.dv.fh-frankfurt.de (klopfer.dv.fh-frankfurt.de
 [194.95.81.200])
 by lists.linaro.org (Postfix) with ESMTPS id 2380560326
 for <greybus-dev@lists.linaro.org>; Thu, 28 Oct 2021 17:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fra-uas.de; 
 s=klopfer;
 h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hat62J85X62jvJyK19mkL5UpXeARlsuAMtNgM0cakMQ=; b=OrJ6bMhVdKX1MAe3VxVbggDFq0
 4Tp5eTficC9pu9CSecIgEDXEBC6tajmUKod4Dq1JZuAeg/RXmLOkO+4/s1JSKEBmje2yYfnumk52m
 dIap75HMWAIXGuxo+UhXi3ioTftNspnHu5i+pUJYEXLUkf/JNaw9UJVRskb/yMg7ygxVnnF2plY20
 3FlGoVKJO7ls3lRHgKcWAzIVTbqO0tkqivBK6+XNDbVXUdbEWwJeHUvJt6l3q4L4rO4ZyrVvtpwbl
 qk7pIwYiQYSUO5IXeh3nl0UYLlUi22cgl4ztmUZyyCUQERXhbJXULdrnigiVIEEqFNPoYQFtN4O3Q
 RGjNk02A==;
Received: from [10.5.14.51] (helo=webmail-se.frankfurt-university.de)
 by klopfer.dv.fh-frankfurt.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
 (envelope-from <ssivaraj@stud.fra-uas.de>)
 id 1mg93n-0007oW-Bz; Thu, 28 Oct 2021 19:19:27 +0200
MIME-Version: 1.0
Date: Thu, 28 Oct 2021 19:19:25 +0200
From: Senthuran Sivarajah <ssivaraj@stud.fra-uas.de>
To: Greg KH <gregkh@linuxfoundation.org>
In-Reply-To: <YXrS9xwJf5AcBoFJ@kroah.com>
References: <20211028153808.9509-1-ssivaraj@stud.fra-uas.de>
 <YXrS9xwJf5AcBoFJ@kroah.com>
Message-ID: <d6841445416a5a4b5e51ba786a607e35@stud.fra-uas.de>
X-Sender: ssivaraj@stud.fra-uas.de
User-Agent: Roundcube Webmail/1.3.9
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Fri, 29 Oct 2021 03:08:48 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

Hello Greg,

I've run the checkpatch.pl script on audio_code.c:
> ./scripts/checkpatch.pl --file --terse 
> drivers/staging/greybus/audio_codec.c

and got the following warning:
> drivers/staging/greybus/audio_codec.c:1032: WARNING: void function 
> return statements are not generally useful

As Brian wrote, we can either remove the return or leave it as is, so my 
"changes" can be ignored. This is not a coding style issue and I should 
have been more clear on the commit message. I apologize for the mistake.

Thank you and @Brian for taking the time to reply.

Kind regards,
Senthu

Am 28.10.2021 18:42, schrieb Greg KH:
> On Thu, Oct 28, 2021 at 05:38:08PM +0200, Senthu Sivarajah wrote:
>> From: Senthuran Sivarajah <ssivaraj@stud.fra-uas.de>
>> 
>> Fixed a coding style issue.
> 
> What coding style exactly?
> 
>> 
>> Signed-off-by: Senthuran Sivarajah <ssivaraj@stud.fra-uas.de>
>> 
>> ---
>>  drivers/staging/greybus/audio_codec.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/staging/greybus/audio_codec.c 
>> b/drivers/staging/greybus/audio_codec.c
>> index b589cf6b1d03..9f99862791dc 100644
>> --- a/drivers/staging/greybus/audio_codec.c
>> +++ b/drivers/staging/greybus/audio_codec.c
>> @@ -1028,7 +1028,7 @@ static int gbcodec_probe(struct 
>> snd_soc_component *comp)
>>  static void gbcodec_remove(struct snd_soc_component *comp)
>>  {
>>  	/* Empty function for now */
>> -	return;
>> +	return 0;
> 
> Did you build this change?
> 
> Exactly what tool reported a problem with this code and what was the
> exact error?
> 
> thanks,
> 
> greg k-h
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
