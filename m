Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Q+rrJSbBEWpqpgYAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 23 May 2026 17:00:54 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C9D5BF814
	for <lists+greybus-dev@lfdr.de>; Sat, 23 May 2026 17:00:54 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F3B93404E3
	for <lists+greybus-dev@lfdr.de>; Sat, 23 May 2026 14:54:44 +0000 (UTC)
Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	by lists.linaro.org (Postfix) with ESMTPS id 824D23F75B
	for <greybus-dev@lists.linaro.org>; Thu, 21 May 2026 18:42:09 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=al2klimov.de header.s=default header.b=HVJbct7E;
	spf=pass (lists.linaro.org: domain of grandmaster@al2klimov.de designates 162.55.223.79 as permitted sender) smtp.mailfrom=grandmaster@al2klimov.de;
	dmarc=pass (policy=quarantine) header.from=al2klimov.de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=rLqbQsV5BI4A
	wXsZDpvAjnsg7vcKqpN0QIFRNDQ3Ztk=; h=in-reply-to:from:references:cc:to:
	subject:date; d=al2klimov.de; b=HVJbct7EJl4+tRj1nh1s/RESvTYEVmJTjBKsIV
	7iX/AVdrTINNz7M++0yOZ3oyqBQdnQKhNo6kFR7VCo4yXYAzzJ5/pxJjpZUIY4edV9wcD0
	u+0sA74PG62QZ9iL8KqAwG+NmOLAJK0Xwnf2sEoupeppo0IxzEoRfMxR5e0NVpTJJA6825
	grQ3rngg36kspM3hSZ3pkyt+iZX2UMmBB644Y92d2Q/b4C3jbP54xwuoVjJeg/2ZF4ehUv
	9fvRUxJ9l6ENgvSW5r/S5FQMejjfi01S43pXS9Y+YqTODCF9P6BOJznXTkLJC0jbZMh2kC
	ROuqoXVs0QF31Gvfvb+Lyntw==
Received: from [IPV6:2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5] (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 10ed28c7 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Thu, 21 May 2026 18:42:07 +0000 (UTC)
Message-ID: <9caaf426-1912-43e0-949f-fb7bb6bbd1cc@al2klimov.de>
Date: Thu, 21 May 2026 20:42:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260520180401.539215-1-grandmaster@al2klimov.de>
 <20260520180401.539215-3-grandmaster@al2klimov.de>
 <2026052158-willing-dreadful-857b@gregkh>
Content-Language: en-US
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
In-Reply-To: <2026052158-willing-dreadful-857b@gregkh>
X-Spamd-Bar: ---
X-MailFrom: grandmaster@al2klimov.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: AXNSN4PS3M5MGFA2RJFV2BVETKB3TTJD
X-Message-ID-Hash: AXNSN4PS3M5MGFA2RJFV2BVETKB3TTJD
X-Mailman-Approved-At: Sat, 23 May 2026 14:54:37 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Elise Lennion <elise.lennion@gmail.com>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio: expect 0 from kstrtoint(), not 1
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AXNSN4PS3M5MGFA2RJFV2BVETKB3TTJD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[al2klimov.de : SPF not aligned (relaxed),quarantine];
	DATE_IN_PAST(1.00)[44];
	R_DKIM_REJECT(1.00)[al2klimov.de:s=default];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.967];
	FROM_NEQ_ENVFROM(0.00)[grandmaster@al2klimov.de,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[al2klimov.de:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lkml.org:url,lists.linaro.org:rdns,lists.linaro.org:helo]
X-Rspamd-Queue-Id: 22C9D5BF814
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/21/26 10:38, Greg Kroah-Hartman wrote:
> On Wed, May 20, 2026 at 08:03:59PM +0200, Alexander A. Klimov wrote:
>> kstrtoint() returns "0 on success, -ERANGE on overflow
>> and -EINVAL on parsing error". In contrast,
>> manager_sysfs_remove_store() and manager_sysfs_dump_store()
>> checked for 1 which always failed the operation. I fixed this.
>>
>> Fixes: f9a21a3f4919 ("staging: greybus: audio_manager_sysfs: Replace sscanf with kstrto* to single variable conversion.")
>> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
>> ---
>>   drivers/staging/greybus/audio_manager_sysfs.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/greybus/audio_manager_sysfs.c b/drivers/staging/greybus/audio_manager_sysfs.c
>> index fcd518f9540c..581791d566e3 100644
>> --- a/drivers/staging/greybus/audio_manager_sysfs.c
>> +++ b/drivers/staging/greybus/audio_manager_sysfs.c
>> @@ -44,7 +44,7 @@ static ssize_t manager_sysfs_remove_store(struct kobject *kobj,
>>   
>>   	int num = kstrtoint(buf, 10, &id);
>>   
>> -	if (num != 1)
>> +	if (num != 0)
> 
> Doesn't checkpatch now complain about this?
No.

$ curl -fsSL https://lkml.org/lkml/diff/2026/5/20/2139/1 | scripts/checkpatch.pl
ERROR: Missing Signed-off-by: line(s)

total: 1 errors, 0 warnings, 0 checks, 16 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or --fix-inplace.

Your patch has style problems, please review.

NOTE: If any of the errors are false positives, please report
       them to the maintainer, see CHECKPATCH in MAINTAINERS.
$

(Ok, sure, it says "Missing Signed-off-by:",
but https://lkml.org/lkml/diff/2026/5/20/2139/1
shows only the diff itself, not the headers.)
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
