Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id F368A47AE5B
	for <lists+greybus-dev@lfdr.de>; Mon, 20 Dec 2021 16:01:04 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5DBFA61001
	for <lists+greybus-dev@lfdr.de>; Mon, 20 Dec 2021 15:01:03 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 47E7A6104A; Mon, 20 Dec 2021 15:01:02 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 610E961004;
	Mon, 20 Dec 2021 15:00:59 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A497460FB6
 for <greybus-dev@lists.linaro.org>; Mon, 20 Dec 2021 14:57:17 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A0B0260FB8; Mon, 20 Dec 2021 14:57:17 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by lists.linaro.org (Postfix) with ESMTPS id 8E59160FB7
 for <greybus-dev@lists.linaro.org>; Mon, 20 Dec 2021 14:57:15 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id b187so13594929iof.11
 for <greybus-dev@lists.linaro.org>; Mon, 20 Dec 2021 06:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TJdNUjWUdmPE7sfT2RNHjkzrtpwFJc2mp64as/HudCM=;
 b=jDdz/ozzcBHT16QK0aB+2kOAZgdLHgDzP2EnuoDKYFIsA+s8BQwOde7Q9B9UBWC9wg
 BYGT/sYwbWltq4FYYQWzmY6Yr1csC2oaElTe3LE//89ujPBqyrakXuX66qMjYDtLIXkD
 m0kTEI2pUi4G/1BoqqRdkF55zJzwaDMfvNr4gHk3JbGwGD0gjbk4TmGqehTuhp2c3m6O
 4bb9kDdIGZmC+PTpZ9XYwot+QCNzL5vv+ecUV3IWrjW9tVHQ2cFmrSYAGHSbfeFqMy9n
 sZPIwd64ab9/ufVq2//++zfu12+pTDSDziUTqPuuC228CYHrM0zGkiojxH9YWgq4BQwY
 bt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TJdNUjWUdmPE7sfT2RNHjkzrtpwFJc2mp64as/HudCM=;
 b=cgGGbiRlJdXde6YHwPU3tPDeKcEAs04vyyCb5w1oHcK1qj7320hkpWIHkPrFbQsM5H
 w5TSXMuzwZNPUxXDS2iHCuYnnstOyveCtvVvHRhxHefhIB/vXG5NN5rOGxIpbaTd8Zam
 C2qNjPWnOCenGhCgOyRpo+EQdLVUI9qOBHGZU0cYMtFdFLZqKNqIZSswol7dCdfAoaWX
 sgxP83GgXAvWfVafhGww0a46dLwfhL8ItQZVswwTafpLsUemodH4EbsQOqMjkaWnfpeh
 /a6nDI+q/Tk7oDYLKx8xZblQ+MUxsLW1qINrKznXTCHcaA1oWi6QlNTLYv4/hrhuKIuz
 Pacw==
X-Gm-Message-State: AOAM531mtGvi+KrM25EhF0Sn+KsE3eFAU3Zy4lUZQ+uAZB+UIWHJUycD
 v4fLcPPNrP4nwW+14UEOJIPRzc4l
X-Google-Smtp-Source: ABdhPJw8nMQz2mCzXM8QGJ6RmKg0otw0hfGtCPZcgichfprE8dtR7mbV3Fy/Lz5YLSaalLN5CZJL5g==
X-Received: by 2002:a05:6638:1481:: with SMTP id
 j1mr9783902jak.59.1640012234690; 
 Mon, 20 Dec 2021 06:57:14 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id r3sm9174856iob.0.2021.12.20.06.57.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 06:57:13 -0800 (PST)
Message-ID: <e71e6496-aecf-8dbc-632f-807cc686a567@linaro.org>
Date: Mon, 20 Dec 2021 08:57:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
To: Mark Greer <mgreer@animalcreek.com>,
 Jorge Eduardo Fermino Oliveia Silva <jorge.ubermensch@gmail.com>
References: <Jorgecommit> <20211217143408.10313-1-jorgeubermensch@gmail.com>
 <20211217233408.GA47062@animalcreek.com>
From: Alex Elder <elder@linaro.org>
In-Reply-To: <20211217233408.GA47062@animalcreek.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] Header line: Coding style fix
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
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On 12/17/21 5:34 PM, Mark Greer wrote:
> On Fri, Dec 17, 2021 at 11:34:08AM -0300, Jorge Eduardo Fermino Oliveia Silva wrote:
> 
> [Note: I am traveling for the next week so I won't be very responsive.]
> 
> Hi Jorge.
> 
> Before we get to the platch please remember that you should send all
> Greybus patches to greybus-dev@lists.linaro.org and
> linux-kernel@vger.kernel.org.  I will add them in now and leave all of
> the context so other can see what you sent.

Thanks for copying the list, Mark.  I concur with your response.

Jorge, this patch is not acceptable, but I have some suggestions.
Your change is very minor (and not technically necessary) but
if you want to try a version 2, we can reconsider it.

First:  Your subject line is not proper.  Patch subjects should begin
with keywords that identify what the patch affects.  If you run this
command:
   git log --oneline drivers/staging/greybus/audio_manager_private.h
you will see examples of commits that affect this file.

Based on that, the header for your patch should be something like:
   staging: greybus: audio: fix a checkpatch complaint
But I don't actually know why you are suggesting this change, and
that brings me to the second point.

Your patch description should be more complete.  Your one line
description says "Solve CHECK: ..." but it doesn't give much
context about that.  Maybe that shows up in a build?  I don't
know.  Your description might be more like:
   When running "checkpatch.pl" we get this warning:
     Lines should not end with a '('
   Fix this by re-formatting the line in question.

But again, I don't actually know where you are seeing this message.
Ideally, your description should be sufficient for someone to be
able to reproduce the problem you're fixing, and then verify that
your fix makes the problem go away.

Third, what Mark points out is absolutely correct, which is that
you are "fixing" one formatting problem but creating a new one.
There is no great solution here, because some of the symbol/type
names are very long.  I have two possible suggestions though:
- Leave it as-is, and accept that the line ends in '('
- Re-format this way, so the warning goes away, but the result
   at least has consistent indentation (even if it isn't aligned
   with the open parenthesis:

int gb_audio_manager_module_create(struct gb_audio_manager_module **module,

         struct kset *manager_kset, int id,

         struct gb_audio_manager_module_descriptor *desc);


Finally, if you submit version 2 of a patch, be sure your subject
line is clear about that, with "[PATCH v2] staging: greybus: ...".

I'll leave it up to you to decide whether to send version 2.  Note
that someone else might reject your patch (even if you do what I
suggest above).  Some people dislike patches which make minor and
unnecessary changes to the code, because of the "churn" effect
they have.

					-Alex

> 
>> Solve CHECK: Lines should not end with a '('
>>
>> Reported-by: Jorge Eduardo Fermino Oliveia Silva <jorgeubermensch@gmail.com>
>> Signed-off-by: Jorge Eduardo Fermino Oliveia Silva <jorgeubermensch@gmail.com>
>> ---
>>   drivers/staging/greybus/audio_manager_private.h | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/staging/greybus/audio_manager_private.h b/drivers/staging/greybus/audio_manager_private.h
>> index 2b3a766c7de7..a17f09a19014 100644
>> --- a/drivers/staging/greybus/audio_manager_private.h
>> +++ b/drivers/staging/greybus/audio_manager_private.h
>> @@ -12,10 +12,10 @@
>>   
>>   #include "audio_manager.h"
>>   
>> -int gb_audio_manager_module_create(
>> -	struct gb_audio_manager_module **module,
>> -	struct kset *manager_kset,
>> -	int id, struct gb_audio_manager_module_descriptor *desc);
>> +int gb_audio_manager_module_create(struct gb_audio_manager_module **module,
>> +				   struct kset *manager_kset,
>> +				   int id,
>> +			struct gb_audio_manager_module_descriptor *desc);
>>   
>>   /* module destroyed via kobject_put */
> 
> The part you're removing has all of the parameters at the same
> indentation level and what you adding has them at two different
> indentation levels so I'm not sure this is a step forward.  Since the
> kernel coding style doesn't address this specific case, AFAICS, I would
> leave it as is despite the complaint.  If others disagree then go ahead
> as I really don't care much either way.
> 
> Mark
> --
> _______________________________________________
> greybus-dev mailing list
> greybus-dev@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/greybus-dev
> 

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
