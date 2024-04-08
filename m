Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D1A89CBAF
	for <lists+greybus-dev@lfdr.de>; Mon,  8 Apr 2024 20:26:26 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 047C243FA5
	for <lists+greybus-dev@lfdr.de>; Mon,  8 Apr 2024 18:26:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id BD39A40F24
	for <greybus-dev@lists.linaro.org>; Mon,  8 Apr 2024 18:26:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="Jgl/1v36";
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of arnd@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=arnd@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 615016136E;
	Mon,  8 Apr 2024 18:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C428EC43390;
	Mon,  8 Apr 2024 18:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712600782;
	bh=zHVhbDUXvIHrWkiMCgJm6IIlq6tLgPd0bdBaL4AIw+g=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=Jgl/1v36x9gPDRGRtgHLpwSWPWCHyO0Au+aX1+oeGjrzJlGRsUOmUY1aLymZ1LD1l
	 uriWZpqBeVIymR/WovDHQoyS0iLtOWMaZ9T6TX6ZZDnAdBr1VVPrskaCTEUMzChLFF
	 b271khNSiAkAf9N/7A2kcLCykf4hAdXZSA5fMuGNmvAYNC1SC2tds+cnVaf3wcfzym
	 5upBRFtDc+qeB/F50U21OOXfzubYNKKNiLpLm+p2vsiyYnmoAG8gO70G+sU+R5kfTB
	 jQK90zKMDPSbIeJ+HSqnJbN2hPnWoyW5CQliIRm23OG+D2MvYaf1UCg8kslhr37SsL
	 RMbdKOukmcmZg==
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfauth.nyi.internal (Postfix) with ESMTP id C1C131200066;
	Mon,  8 Apr 2024 14:26:20 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 08 Apr 2024 14:26:20 -0400
X-ME-Sender: <xms:zDYUZnSXwNry391rmaAK2q6pWJ7P0xZmJqjLiKNUODDJ3Pk00Nb_og>
    <xme:zDYUZozQ-Krgj5gAi4w0A6kwSsFcIV-8dt9B-4wIyRh2cXKg42gpmJ8Jlp6Co3E4R
    xmMNRybm_uDDjY3Vo0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudegiedguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtf
    frrghtthgvrhhnpefgffejleeluddugfejueeiteefvddtgfeutefhvdfgudfhveekgeeh
    gfevledvudenucffohhmrghinhepphgrshhtvggsihhnrdgtohhmnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguodhmvghsmhhtphgr
    uhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedtvdegqddvkeejtddtvdeigedqrg
    hrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:zDYUZs3rvvfu67uhmCGEJAPq0TQAmvT7jZzbrj7k9JydV3_k6Zvy9g>
    <xmx:zDYUZnAABHBYRqtaQ-sy4qdjwWZ5twBGfpIp6UlPW9OgKyogl3P1qA>
    <xmx:zDYUZgiUnA3CotxjZrPEu_YvIt0FIAQQQTrD-b2MARoGg2OoNZYR0g>
    <xmx:zDYUZrrT8GCJZwI1mE0yIznln8ztL49PsAFRhw2fLcHjtuTVD2lhFw>
    <xmx:zDYUZrjT2JJ-Q1GpA_EUI3Mpg9KqHNMSXAZdTcxUwl0GX5MSayuguQmB>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 81795B60089; Mon,  8 Apr 2024 14:26:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-368-gc733b1d8df-fm-20240402.001-gc733b1d8
MIME-Version: 1.0
Message-Id: <1622d9ff-feed-4a12-9d8d-3f00088c9edf@app.fastmail.com>
In-Reply-To: <76214105-94ae-4540-8511-e9e2ff6d257e@moroto.mountain>
References: <20240328140512.4148825-1-arnd@kernel.org>
 <20240328140512.4148825-11-arnd@kernel.org>
 <76214105-94ae-4540-8511-e9e2ff6d257e@moroto.mountain>
Date: Mon, 08 Apr 2024 20:26:00 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
X-Rspamd-Queue-Id: BD39A40F24
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.99 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linuxfoundation.org,arndb.de,wanadoo.fr,lists.linaro.org,lists.linux.dev];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	URIBL_BLOCKED(0.00)[arndb.de:email,dfw.source.kernel.org:helo,dfw.source.kernel.org:rdns];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: BLJ5N7KXVMR77UCXEVUUZYAKUIHZSHDA
X-Message-ID-Hash: BLJ5N7KXVMR77UCXEVUUZYAKUIHZSHDA
X-MailFrom: arnd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 10/11] staging: greybus: change strncpy() to strscpy()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BLJ5N7KXVMR77UCXEVUUZYAKUIHZSHDA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 28, 2024, at 16:00, Dan Carpenter wrote:
> On Thu, Mar 28, 2024 at 03:04:54PM +0100, Arnd Bergmann wrote:
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>> This is from randconfig testing with random gcc versions, a .config to
>> reproduce is at https://pastebin.com/r13yezkU
>> ---
>>  drivers/staging/greybus/fw-management.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
>> index 3054f084d777..35bfdd5f32d2 100644
>> --- a/drivers/staging/greybus/fw-management.c
>> +++ b/drivers/staging/greybus/fw-management.c
>> @@ -303,13 +303,13 @@ static int fw_mgmt_backend_fw_update_operation(struct fw_mgmt *fw_mgmt,
>>  	struct gb_fw_mgmt_backend_fw_update_request request;
>>  	int ret;
>>  
>> -	strncpy(request.firmware_tag, tag, GB_FIRMWARE_TAG_MAX_SIZE);
>> +	ret = strscpy(request.firmware_tag, tag, GB_FIRMWARE_TAG_MAX_SIZE);
>
> This needs to be strscpy_pad() or it risks an information leak.

Right, I think I misread the code thinking that the strncpy()
destination was user provided, but I see now that this copy is
from user-provided data into the stack, so the padding is indeed
stale stack data.

I could not find out whether this gets copied back to userspace,
but adding the padding is safer indeed.

>>  
>>  	/*
>>  	 * The firmware-tag should be NULL terminated, otherwise throw error and
>                                       ^^^^^^^^^^^^^^^^
> These comments are out of date.
>
>>  	 * fail.
>>  	 */
>> -	if (request.firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
>> +	if (ret == -E2BIG) {
>>  		dev_err(fw_mgmt->parent, "backend-update: firmware-tag is not NULL terminated\n");
>                                                           
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> More out of date prints.

I had thought about changing it when I did the patch, but could
not come up with anything that describes the error condition better:
the cause of the -E2BIG error is still the missing NUL-termination
in the provided string.

Maybe we should instead not print a warning at all? The general
rule is that user triggered operations should not lead to
spamming the kernel logs.

     Arnd
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
